import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

port = 25
smtp_server = "<SMTP-SERVER>"
sender_email = "<FROM-ADDRESS>"
receiver_email = "<TO-ADDRESS>"
message = MIMEMultipart("alternative")
message["Subject"] = "<SUBJECT>"
message["From"] = sender_email
message["To"] = receiver_email

# text/plain message
text = """\
This is the text version of the message"""

# HTML message
html = """\
<html>
  <body>
    <p>This is the HTML version of the message</p>
  </body>
</html>
"""

# convert both parts to MIMEText objects and add them to the MIMEMultipart message
part1 = MIMEText(text, "plain")
part2 = MIMEText(html, "html")
message.attach(part1)
message.attach(part2)

# send your email
with smtplib.SMTP(smtp_server, port) as server:
    server.sendmail(
        sender_email, receiver_email, message.as_string()
    )

print('Sent')