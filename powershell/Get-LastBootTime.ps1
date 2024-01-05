Get-WmiObject win32_operatingsystem | Select-Object csname, @{LABEL='LastBootUpTime'; EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}}
