IDENTIFICATION DIVISION.
PROGRAM-ID. LOGIN.

* This program demonstrates how to use DEC Forms in COBOL on OpenVMS
* to create a simple login form. Please note that the username and
* password used in this example are for demonstration purposes only
* and are not secure.

ENVIRONMENT DIVISION.

DATA DIVISION.

PROCEDURE DIVISION.
   INVOKE SYS$GGETDVI "TT", "TERM_TYPE", "VT100".
   INVOKE SYS$GGETDVI "TT", "ANSI_MODE", "YES".
   INVOKE SYS$GGETDVI "TT", "DEC_FORMS", "YES".

   INVOKE DECFORMS$INIT.

   INVOKE DECFORMS$CREATE("LOGIN_FORM", "LOGIN")
   INVOKE DECFORMS$ADD("LOGIN_FORM", "USERNAME", "USERNAME:")
   INVOKE DECFORMS$ADD("LOGIN_FORM", "PASSWORD", "PASSWORD:")

   INVOKE DECFORMS$DISPLAY("LOGIN_FORM")

   INVOKE DECFORMS$INPUT("LOGIN_FORM", "USERNAME", USERNAME)
   INVOKE DECFORMS$INPUT("LOGIN_FORM", "PASSWORD", PASSWORD)

   IF (USERNAME = "admin" .and. PASSWORD = "password")
      DISPLAY "ACCESS GRANTED"
   ELSE
      DISPLAY "ACCESS DENIED"
   END-IF

   INVOKE DECFORMS$DESTROY("LOGIN_FORM")

   INVOKE DECFORMS$TERM.

END PROGRAM LOGIN.
