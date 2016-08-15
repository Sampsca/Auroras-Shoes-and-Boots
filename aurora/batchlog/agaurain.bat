@echo off
IF NOT EXIST "override\ag0540.tis" goto tiles
goto end

:tiles
aurora\batchlog\tisunpack -s -o override\ag0540.tis aurora\tiz\ag0540.tiz
aurora\batchlog\tisunpack -s -o override\ag1110.tis aurora\tiz\ag1110.tiz
aurora\batchlog\tisunpack -s -o override\ag2020.tis aurora\tiz\ag2020.tiz

:end
::::
