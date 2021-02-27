import mongoengine

from categories.model import Categories
from usersGoals.model import UserGoals


def mark_subscribed(func):
    def wrapper(*args, **kwargs):
        goals = func(*args, **kwargs)
        userId = kwargs.get('userId', None)
        if userId is None:
            userId = args[1]
        pipeline = [{"$match": {"userId": userId}},
                    {"$project": {"goalId": 1, "_id": 0}}]
        subscribed = [x["goalId"] for x in list(UserGoals.objects.aggregate(*pipeline))]
        for i in range(len(goals)):
            goals[i]['isSubscribed'] = goals[i]['goalId'] in subscribed
        return goals

    return wrapper


def find_one(func):
    def wrapper(*args, **kwargs):
        res = func(*args, **kwargs)
        if len(res) == 0:
            raise mongoengine.errors.DoesNotExist
        return res.pop()

    return wrapper


def inject_categoryId(func):
    """
    Find categoryId from category name and
    inject categoryId into data (if exists)
    @param func:
    @return:
    """

    def wrapper(*args, **kwargs):
        for arg in args + tuple(kwargs.values()):
            if isinstance(arg, dict) and "category" in arg:
                category = arg["category"].strip()
                categoryId = Categories.objects.get(name=category)["categoryId"]
                arg["categoryId"] = categoryId

        return func(*args, **kwargs)

    return wrapper
