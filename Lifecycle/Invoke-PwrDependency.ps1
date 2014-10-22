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

Function Invoke-PwrDependency{
  Param(
    [Parameter(
        Position=0,
        Mandatory=$true)
    ]
    [Alias('Config')]
    [System.Xml.XmlElement[]] $pwrdeps)

  Begin {

    $dependency = {

      if ([string]::IsNullOrWhiteSpace($_.Check)) {

        Write-Warning "Dependency Check $($_.Name): No Check ScriptBlock"

      } else {
      
        if (iex ($ExecutionContext.InvokeCommand.ExpandString($_.Check))) {

          Write-Verbose "Dependency Check $($_.Name): Passed"
          Write-Verbose "Dependency Install $($_.Name): Not Needed"

        } else {

          Write-Warning "Dependency Check $($_.Name): Failed"
          
          if ([string]::IsNullOrWhiteSpace($_.Install)) {

            Write-Warning "Dependency Install $($_.Name): No Install ScriptBlock"

          } else {

            iex ($ExecutionContext.InvokeCommand.ExpandString($_.Install))

            if (iex ($ExecutionContext.InvokeCommand.ExpandString($_.Check))) {
            
              Write-Verbose "Dependency Install $($_.Name): Completed"
            
            } else {

              Write-Warning "Dependency Install $($_.Name): Failed"

            }

          }

        }
      }
    }
  }
  
  Process {

    $pwrdeps.ChildNodes | Sort-Object Priority | ForEach-Object -Process $dependency
    
  }
}