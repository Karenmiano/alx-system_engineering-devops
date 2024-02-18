# Post-Mortem Report: Website server Error

Between the hour of 15:30 and 16:30 EAT  on 24th January, 2024, our website users encountered a 500 server error message. This was coincidentally shortly after we had
deployed our new ‘transfer cost’ feature on our e-commerce website. Finally the issue was found to be a typo in one of our wordpress configuration files.

# Course of Action

The process of debugging was quite tedious because on deploying the feature we knew that not many of the other files had been touched or their code changed since it was just an add on. The feature had been rigorously tested and working as expected before deploying. The log files on the server were in the least way helpful.

Eventually the error was found to be an error in one of our wordpress config files thanks to a tool called ‘strace’. Strace is used to investigate system calls being made by a program. We realized that there was a file reported as not found and truly that was expected since the named file had a spelling mistake.We further investigated which code in our files could be calling this particular file. For this we used ‘grep’ to search through the directory containing the configuration files and globally corrected the typo using ‘sed’ to ensure we didn’t leave out anything.

# Corrective and Preventative measures

The found typo was quite unusual as there were no changes that we anticipated to make in the file in the course of the feature creation. Most likely maybe it was an unintended action made by someone investigating the file, the reason still is not known. However tools such as strace came to the rescue after much searching!
