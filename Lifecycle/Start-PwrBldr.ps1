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

Function Start-pwrbldr{
  Param(
    [Parameter(
        Position=0,
        Mandatory=$true)
    ]
    [Alias('Config')]
    [System.Xml.XmlElement[]] $pwrconfig)

  Begin {
   
    $components = {

      $_.Name


    }

  }
  
  Process {

    $pwrconfig.ChildNodes | ForEach-Object -Process $components
    
  }
  
  
}

Export-ModuleMember -Function "Start-PwrBldr"