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

Function Start-PwrApp{
  Param(
    [Parameter(
        Position=0)
    ]
    [Alias('Config')]
    [string] $configname = 'pwrbldr')

  Begin {

    $config = Get-PwrConfig $configname

    $engines = {
    
      $engineflow = Get-Command "Start-$($_.Name)"

      Invoke-AsWorkflow -CommandName $engineflow
     
    }

  }
  
  Process {

    $config.ChildNodes | ForEach-Object -Process $engines

  }
  
  
}

Export-ModuleMember -Function "Start-PwrApp"