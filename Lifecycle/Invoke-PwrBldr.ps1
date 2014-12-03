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

Function Invoke-PwrBldr{
  Param(
    [Parameter(
        Position=0)
    ]
    [Alias('Config')]
    [xml] $configdoc)

  Begin {

    Write-Debug "$($MyInvocation.InvocationName): begin{}"

    $components = {
    
      Write-Debug "$($MyInvocation.InvocationName): components{}"
      
      $componentcmd = "$($_.Node.Name)"

      Write-Verbose "Component command set: $enginecmd"
      
      $componentxmldoc = New-Object System.Xml.XmlDocument

      $componentxmldoc.AppendChild($componentxmldoc.ImportNode($_.Node, $true)) | Out-Null

      Write-Verbose "Wraped XmlNode $($_.Node.Name) in new XmlDocument"
    
      $componentargs = @{"config" = $componentxmldoc}
      
      Write-Verbose "Built component param hashtable"

      $componentexp = "$componentcmd @componentargs"
    
      Write-Verbose "Invoking engine expression: $componentexp "

      Invoke-Expression $componentexp

    }

  }
  
  Process {

    Write-Debug "$($MyInvocation.InvocationName): process{}"

    $configdoc | #Test for pwrsvr

    #inventory system

    #upload inventory

    #get response from server (if no config then wait, if config continue)

    #apply local configuration

    #psdsc kickoff

    if([string]::IsNullOrWhiteSpace($configdoc.pwrbldr.server)) {

      Write-Error "PwrBuilder Server is missing!"

    }
   
  }
  
  
}