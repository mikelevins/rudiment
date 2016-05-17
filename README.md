# rudiment

Rudiment is a skeleton project I made for myself to help me set up
Lisp-based webapps more easily. It relies on the following tools and
frameworks:

- **Common Lisp**
- **quicklisp** for package management
- **Bootstrap** for CSS and Javascript support

Libraries from quicklisp:

- **queues** to support concurrent client operations
- **ironclad** for encryption support
- **uuid** for generating unique IDs
- **rfc-3339-timestamp** for generating timestamps
- **restas** for webserver support
- **cl-markup** for generating HTML from Lisp code
- **cl-emb** for generating pages from page templates
- **parenscript** for generating Javascript from Lisp code
- **lass** for generating CSS files

rudiment is not a functional web application. It is a minimal skeleton
used to speed up the process of setting up new projects.

rudiment is not a tutorial. It is not intended to teach you how to
write web apps in Common Lisp, though a determined person might figure
out how to do it by examining the code.

rudiment is a template for use in creating new restas-based webapp
projects, no more, and no less.



