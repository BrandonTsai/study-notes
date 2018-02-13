
Error Handle
============


## Push fail. error: src refspec master does not match any.

1. Try git show-ref to see what refs do you have. Is there refs/heads/master?

2. Try git push origin HEAD:master as more local-reference-independent solution.
