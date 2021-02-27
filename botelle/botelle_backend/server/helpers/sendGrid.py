import os

from firebase_admin import auth
from sendgrid.helpers.mail import Mail

from context import ServiceContext

YASS_EMAIL = "hello@theyassapp.com"
VERIFY_EMAIL_SUBJECT = "Yass! Verify your email"
VERIFY_EMAIL_TEMPLATE = "server/assets/verify_email_template.html"
RESET_PASSWORD_SUBJECT = "Your Yass! Recovery password"
RESET_PASSWORD_TEMPLATE = "assets/reset_password_template.html"
env = os.environ.get("ENV")
ACTION_CODE_URL = f"theyassapp{env}.page.link"
if env == "Local":
    ACTION_CODE_URL = "theyassappdev.page.link"


class SendGridClient:
    def __init__(self, context: ServiceContext):
        self.logger = context.logger
        self.sendgrid_client = context.sendgrid_client
        self.message = None
        self.html_content = None
        self.to = None
        self.sender = YASS_EMAIL
        self.subject = ""

    def send(self):
        response = self.sendgrid_client.send(self.message)
        self.logger.info(f'Sending...SendGrid Response: {response.status_code}')

    def _set_message(self):
        self.message = Mail(
            from_email=self.sender,
            to_emails=self.to,
            subject=self.subject,
            html_content=self.html_content)

    def send_reset_password(self, toEmail, recoveryPwd):
        template = self._get_html_template(RESET_PASSWORD_TEMPLATE)
        self.html_content = template.replace("%recovery_pwd", recoveryPwd)
        self.subject = RESET_PASSWORD_SUBJECT
        self._set_message()
        self.send()

    def send_verify_email(self, toEmail, name):
        try:
            link = auth.generate_email_verification_link(toEmail)
            template = self._get_html_template(VERIFY_EMAIL_TEMPLATE)
            self.html_content = template.replace("%link", link).replace("%name", name)
            self.subject = VERIFY_EMAIL_SUBJECT
            self._set_message()
            self.send()
        except Exception as e:
            self.logger.error(e)

    def _get_html_template(self, template):
        f = open(template, "r")
        htmlContent = f.read()
        return htmlContent
