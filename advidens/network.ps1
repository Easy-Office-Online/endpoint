cmd.exe /C "cmdkey /add:`"192.168.130.130`" /user:`".\share`" /pass:`"AdvidensCompleet85!`""

New-PSDrive -Name I -PSProvider FileSystem -Root "\\192.168.130.130\Maex" -Persist