#requires -version 2
<#
.SYNOPSIS
  <Overview of script>

.DESCRIPTION
  <Brief description of script>

.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        1.0
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>

Function Find-PwrConfig{
  Param(
    [Parameter(
        Position=0, 
        Mandatory=$true, 
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true)
    ]
    [Alias('Config')]
    [string] $pwrconfig
  )
  
  Begin{

    [string] $path = "$env:ProgramData\pwrbldr\config\$pwrconfig.xml"

  }
  
  Process{

    if (Test-Path $path) {

      Write-Output $path

    } else {

      Write-Error "Config file $path does not exists."

    }

  }
  
  End{
  }
}

Export-ModuleMember -Function "Find-PwrConfig"