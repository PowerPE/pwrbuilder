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

Function Invoke-PwrDsc{
  Param(
    [Parameter(
        Position=0,
        Mandatory=$true)
    ]
    [Alias('Config')]
    [System.Xml.XmlElement[]] $pwrdscsettings)

  Begin {

    [xml]$dscconfigdoc = New-Object Xml

    $dscconfigdata = @{
      AllNodes = @();
    }

    $xmlconfigchild = {

      $dscconfigdoc.AppendChild($dscconfigdoc.ImportNode($_, $true)) | Out-Null

    }

    $xmlconfigurationdata = {
    
      $_.Node.ChildNodes | ForEach-Object -Process {
      
        $confighashtable = @{}
       
        $_ | Select-Xml './*' | ForEach-Object -Process {
          
          $confighashtable.Set_Item($_.Node.Name,$_.Node.('#text'))

        }

        $dscconfigdata.Set_Item($_.Name, $confighashtable)
      
    }

   }

   $xmlconfiguration = {
     $dynamicblock = @"
       Configuration $($_.Node.Name)
         {

           

         }
"@

   }

  }
  
  Process {

    Write-Verbose "Convert pwrdsc XmlElement[] to XmlDocument"
    $pwrdscsettings | ForEach-Object -Process $xmlconfigchild
  
    Write-Verbose "Convert configurationdata XmlNode to hashtable"
    $dscconfigdoc | Select-Xml '/pwrdsc/configurationdata' | ForEach-Object -Process $xmlconfigurationdata

    Write-Verbose "Generate DSC configurations from configuration XmlNode"
    $dscconfigdoc | Select-Xml '/pwrdsc/configuration' | ForEach-Object -Process $xmlconfiguration
    
    
    Configuration LocalConfiguration
    {

      Node localhost
      {

        

      }

    }
    
  }
}