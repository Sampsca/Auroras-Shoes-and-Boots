@echo off
IF NOT EXIST "override\ag4301.tis" goto tiles
goto end

:tiles
aurora\batchlog\tisunpack -s -o override\ag4301.tis aurora\utiz\ag4301.tiz
aurora\batchlog\tisunpack -s -o override\ag4815.tis aurora\utiz\ag4815.tiz

:end
::::
