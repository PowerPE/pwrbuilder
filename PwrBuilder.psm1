#Autoloadfiles

Get-ChildItem ("$PSScriptRoot\Lifecycle\") | Where `
    { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
    { . $_.FullName }

Get-ChildItem ("$PSScriptRoot\Communications\") | Where `
    { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
    { . $_.FullName }

Get-ChildItem ("$PSScriptRoot\Common\") | Where `
    { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
    { . $_.FullName }


#Load Base UI
RibbonWindow { 
   Ribbon -Items {
      RibbonTab -Header "Task A" { 
         RibbonGroup -Header "PoshCode" { 
            # The ImageSource needs to be a path to an image...
            RibbonButton -LargeImageSource "http://huddledmasses.org/images/icons/PoshCode.png" -Label "PoshCode"
         }
      }
      RibbonTab -Header "Task B" 
   }
} -Title "PowerPE Builder" -Show

#Populate System with Defaults

#Override Defaults

#Load Extensions

#Run
