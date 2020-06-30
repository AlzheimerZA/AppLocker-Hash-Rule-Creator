#############################################################################
#                                     			 		                    #
#   This Sample Code is provided for the purpose of illustration only       #
#   and is not intended to be used in a production environment.  THIS       #
#   SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT    #
#   WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT    #
#   LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS     #
#   FOR A PARTICULAR PURPOSE.  We grant You a nonexclusive, royalty-free    #
#   right to use and modify the Sample Code and to reproduce and distribute #
#   the object code form of the Sample Code, provided that You agree:       #
#   (i) to not use Our name, logo, or trademarks to market Your software    #
#   product in which the Sample Code is embedded; (ii) to include a valid   #
#   copyright notice on Your software product in which the Sample Code is   #
#   embedded; and (iii) to indemnify, hold harmless, and defend Us and      #
#   Our suppliers from and against any claims or lawsuits, including        #
#   attorneys' fees, that arise or result from the use or distribution      #
#   of the Sample Code.                                                     #
#                                     			 		                    #
#   Author: John Guy                                                        #
#   Version 1.0         Date Last modified:      26 November 2019           #
#                                     			 		                    #
#############################################################################

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '500,400'
$Form.text                       = "AppLocker Hash Rule v1.0"
$Form.TopMost                    = $false

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Select Rule Collection:"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(10,20)
$Label1.Font                     = 'Microsoft Sans Serif,10'

$ComboBox1                       = New-Object system.Windows.Forms.ComboBox
$ComboBox1.width                 = 170
$ComboBox1.height                = 20
@('Script','Exe','Msi') | ForEach-Object {[void] $ComboBox1.Items.Add($_)}
$ComboBox1.location              = New-Object System.Drawing.Point(178,19)
$ComboBox1.Font                  = 'Microsoft Sans Serif,10'

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Rule Name:"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(14,75)
$Label2.Font                     = 'Microsoft Sans Serif,10'

$TextBoxRN                       = New-Object system.Windows.Forms.TextBox
$TextBoxRN.multiline             = $false
$TextBoxRN.width                 = 230
$TextBoxRN.height                = 20
$TextBoxRN.location              = New-Object System.Drawing.Point(117,70)
$TextBoxRN.Font                  = 'Microsoft Sans Serif,10'

$TextBoxRD                       = New-Object system.Windows.Forms.TextBox
$TextBoxRD.multiline             = $false
$TextBoxRD.width                 = 230
$TextBoxRD.height                = 20
$TextBoxRD.location              = New-Object System.Drawing.Point(117,110)
$TextBoxRD.Font                  = 'Microsoft Sans Serif,10'

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Rule Discription:"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(14,115)
$Label3.Font                     = 'Microsoft Sans Serif,10'

$TextBoxHV                       = New-Object system.Windows.Forms.TextBox
$TextBoxHV.multiline             = $false
$TextBoxHV.width                 = 230
$TextBoxHV.height                = 20
$TextBoxHV.location              = New-Object System.Drawing.Point(117,150)
$TextBoxHV.Font                  = 'Microsoft Sans Serif,10'

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "Hash Value:"
$Label4.AutoSize                 = $true
$Label4.width                    = 25
$Label4.height                   = 10
$Label4.location                 = New-Object System.Drawing.Point(14,155)
$Label4.Font                     = 'Microsoft Sans Serif,10'

$TextBoxFN                       = New-Object system.Windows.Forms.TextBox
$TextBoxFN.multiline             = $false
$TextBoxFN.width                 = 230
$TextBoxFN.height                = 20
$TextBoxFN.location              = New-Object System.Drawing.Point(117,200)
$TextBoxFN.Font                  = 'Microsoft Sans Serif,10'

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = "File Name:"
$Label5.AutoSize                 = $true
$Label5.width                    = 25
$Label5.height                   = 10
$Label5.location                 = New-Object System.Drawing.Point(14,205)
$Label5.Font                     = 'Microsoft Sans Serif,10'

$TextBoxLDAP                       = New-Object system.Windows.Forms.TextBox
$TextBoxLDAP.multiline             = $false
$TextBoxLDAP.width                 = 230
$TextBoxLDAP.height                = 20
$TextBoxLDAP.location              = New-Object System.Drawing.Point(117,250)
$TextBoxLDAP.Font                  = 'Microsoft Sans Serif,10'

$Label6                          = New-Object system.Windows.Forms.Label
$Label6.text                     = "LDAP:"
$Label6.AutoSize                 = $true
$Label6.width                    = 25
$Label6.height                   = 10
$Label6.location                 = New-Object System.Drawing.Point(14,255)
$Label6.Font                     = 'Microsoft Sans Serif,10'

$Label8                          = New-Object system.Windows.Forms.Label
$Label8.text                     = "Example:"
$Label8.AutoSize                 = $true
$Label8.width                    = 25
$Label8.height                   = 10
$Label8.location                 = New-Object System.Drawing.Point(200,280)
$Label8.Font                     = 'Microsoft Sans Serif,10,style=Underline'

$Label7                          = New-Object system.Windows.Forms.Label
$Label7.text                     = "LDAP://DC.domain.local/CN={GPO_Unique_ID},CN=Policies,CN=System,DC=domain,DC=local"
$Label7.AutoSize                 = $true
$Label7.BackColor                = "#f8e71c"
$Label7.width                    = 25
$Label7.height                   = 10
$Label7.location                 = New-Object System.Drawing.Point(14,300)
$Label7.Font                     = 'Microsoft Sans Serif,8'

$ButtonCancel                    = New-Object system.Windows.Forms.Button
$ButtonCancel.text               = "Cancel"
$ButtonCancel.width              = 60
$ButtonCancel.height             = 30
$ButtonCancel.location           = New-Object System.Drawing.Point(230,363)
$ButtonCancel.Font               = 'Microsoft Sans Serif,10'

$ButtonOK                        = New-Object system.Windows.Forms.Button
$ButtonOK.text                   = "Add Rule"
$ButtonOK.width                  = 70
$ButtonOK.height                 = 30
$ButtonOK.location               = New-Object System.Drawing.Point(150,363)
$ButtonOK.Font                   = 'Microsoft Sans Serif,10'

$ButtonC                        = New-Object system.Windows.Forms.Button
$ButtonC.text                   = "Create Rule File"
$ButtonC.width                  = 140
$ButtonC.height                 = 30
$ButtonC.location               = New-Object System.Drawing.Point(150,330)
$ButtonC.Font                   = 'Microsoft Sans Serif,10'

$Splashform = New-Object System.Windows.Forms.Form
$Splashform.MaximizeBox = $false
$Splashform.MinimizeBox = $false
$Splashform.ShowIcon = $false
$Splashform.ControlBox = $false
$Splashform.Width = '350'
$Splashform.Height = '70'
$splashform.Visible = $false
$splashbusy = New-Object System.Windows.Forms.Label
$splashbusy.Width = '300'
$splashbusy.Height = 50
$splashbusy.Text = 'Processing...'
$splashbusy.Location = '20, 10'
$Splashform.Controls.Add($splashbusy)

$Form.controls.AddRange(@($Label1,$ComboBox1,$Label2,$TextBoxRN,$TextBoxRD,$Label3,$TextBoxHV,$Label4,$TextBoxFN,$Label5,$Label6,$Label7,$Label8,$TextBoxLDAP,$ButtonCancel,$ButtonOK,$ButtonC))

$ButtonOK.Add_Click(
{
if ((Validate-Test -page 1) -ne 'Stop')
{



# Verify that $rootDir has been defined and is an existing directory.
if ($null -eq $rootDir -or !(Test-Path($rootDir)))
{
    Write-Error ('Script error: variable $rootDir is not defined prior to invoking ' + $MyInvocation.MyCommand.Path)
    return
}

$ps1_HashRuleData               = [System.IO.Path]::Combine($rootDir, "HashRuleData.ps1")

function SaveXmlDocAsUnicode([System.Xml.XmlDocument] $xmlDoc, [string] $xmlFilename)
{
    $xws = [System.Xml.XmlWriterSettings]::new()
    $xws.Encoding = [System.Text.Encoding]::Unicode
    $xws.Indent = $true
    $xw = [System.Xml.XmlWriter]::Create($xmlFilename, $xws)
    $xmlDoc.Save($xw)
    $xw.Close()
}

function SaveAppLockerPolicyAsUnicodeXml([Microsoft.Security.ApplicationId.PolicyManagement.PolicyModel.AppLockerPolicy]$ALPolicy, [string]$xmlFilename)
{
    SaveXmlDocAsUnicode -xmlDoc ([xml]($ALPolicy.ToXml())) -xmlFilename $xmlFilename
}

# Delete previous set of dynamically-generated rules first
Remove-Item ([System.IO.Path]::Combine($rootDir, "*.xml"))


# Create custom hash rules
Write-Host "Creating extra hash rules ..." -ForegroundColor Cyan

# Define an empty AppLocker policy to fill, with a blank hash rule to use as a template.
$hashRuleXml = [xml]@"
    <AppLockerPolicy Version="1">
      <RuleCollection Type="Exe" EnforcementMode="NotConfigured">
        <FileHashRule Id="" Name="" Description="" UserOrGroupSid="S-1-1-0" Action="Allow">
            <Conditions>
              <FileHashCondition>
                <FileHash Type="SHA256" Data="" SourceFileName="" SourceFileLength="0"/>
              </FileHashCondition>
            </Conditions>
        </FileHashRule>
      </RuleCollection>
      <RuleCollection Type="Dll" EnforcementMode="NotConfigured"/>
      <RuleCollection Type="Script" EnforcementMode="NotConfigured"/>
      <RuleCollection Type="Msi" EnforcementMode="NotConfigured"/>
    </AppLockerPolicy>
"@
# Get the blank hash rule. It will be cloned to make the real hash rules.
$fhrTemplate = $hashRuleXml.DocumentElement.SelectNodes("//FileHashRule")[0]
# Remove the template rule from the main document
$fhrTemplate.ParentNode.RemoveChild($fhrTemplate) | Out-Null
# fhrRulesNotEmpty: Don't generate ExtraHashRules.xml if it doesn't have any rules.
$fhrRulesNotEmpty = $false

# Run the script that produces the hash information to process.
$hashRuleData = (& $ps1_HashRuleData)

$hashRuleData | foreach {

    $fhr = $fhrTemplate.Clone()
    $fhr.Id = [string]([GUID]::NewGuid().Guid)
    $fhr.Name = $_.RuleName
    $fhr.Description = $_.RuleDesc
    $fhr.Conditions.FileHashCondition.FileHash.Data = $_.HashVal
    $fhr.Conditions.FileHashCondition.FileHash.SourceFileName = $_.FileName

    $node = $hashRuleXml.SelectSingleNode("//RuleCollection[@Type='" + $_.RuleCollection + "']")
    if ($node -eq $null)
    {
        Write-Warning ("Couldn't find RuleCollection Type = " + $_.RuleCollection + " (RuleCollection is case-sensitive)")
    }
    else
    {
        $node.AppendChild($fhr) | Out-Null
        $fhrRulesNotEmpty = $true
    }
}

# Don't generate the file if it doesn't contain any rules
if ($fhrRulesNotEmpty)
{
    $outfile = [System.IO.Path]::Combine($rootDir, "ExtraHashRules.xml")
    # Save XML as Unicode
    SaveXmlDocAsUnicode -xmlDoc $hashRuleXml -xmlFilename $outfile
}

#Backup the current AppLocker Policy
Write-Host "Creating backup of current AppLocker Policy ..." -ForegroundColor Cyan
Get-AppLockerPolicy -Domain -LDAP "$($TextBoxLDAP.text)" -XML > $rootDir\AppLocker_Backup.xml


# Verify that ExtraHashRules.xml has been created and is in the directory.
$fileToCheck = ".\ExtraHashRules.xml"
if (Test-Path $fileToCheck -PathType leaf) 
{
#Merge the new hash rules created into the current AppLocker Policy
Write-Host "Merge created HASH rules to the current AppLocker Policy ..." -ForegroundColor Cyan
Set-AppLockerPolicy -XMLPolicy $rootDir\ExtraHashRules.xml -LDAP "$($TextBoxLDAP.text)" -merge
}
else
{
    Write-Error ('Script error: ExtraHashRule.xml does not exist. Populate HASH deatils in HashRuleData.ps1')
    return
}
Remove-Item -path .\ExtraHashRules.xml
Remove-Item -path .\HashRuleData.ps1
$Splashform.Visible = $false
$Form.Close()
 }}
 )
 

$ButtonCancel.Add_Click(
{ 
$Form.Close() 
}
)

$ButtonC.Add_Click(
{ 
if ((Validate-Test -page 2) -ne 'Stop')
{
$Splashform.Location = "$($Form.Location.X + 100), $($Form.Location.Y + 200)"
$string = @"
@{
RuleCollection = "$($ComboBox1.text)";
RuleName = "$($TextboxRN.text)";
RuleDesc = "$($TextBoxRD.text)";
HashVal  = "$($TextBoxHV.text)";
FileName = "$($TextBoxFN.text)"
}

"@

    Set-Content -Path '.\HashRuleData.ps1' -Value $string

    $splashbusy.Text = $return + 'Hash Rule File Created'
    $Splashform.Visible = $true
    Start-Sleep 3
    $Splashform.Visible = $false
    
    }
}
)

Function Validate-Test
{
Param($page)

    $Splashform.Location = "$($Form.Location.X + 100), $($Form.Location.Y + 200)"
    
    $Splashform.Visible = $true
    [string]$return = ''
Switch ($page)
{
1 {
    #if ($ComboBox1.Text -eq '') {$return = $return + 'Rule Collection ;' }
    if ($TextBoxLDAP.Text -eq '') {$return = $return + 'LDAP '}
    #if ($TextBoxRN.Text -eq '') {$return = $return + 'Rule Name ;'}
    #if ($TextBoxHV.Text -eq '') {$return = $return + 'Hash Value ;'}
    #if ($TextBoxFN.Text -eq '') {$return = $return + 'File name ;'}

}
2 {

    IF ($ComboBox1.Text -eq '') {$return = $return + 'Rule Collection ;' }
    IF ($TextBoxLDAP.Text -eq '') {$return = $return + 'LDAP ;'}
    IF ($TextBoxRN.Text -eq '') {$return = $return + 'Rule Name ;'}
    IF ($TextBoxHV.Text -eq '') {$return = $return + 'Hash Value ;'}
    IF ($TextBoxFN.Text -eq '') {$return = $return + 'File name ;'}

}
}
If ($return -ne '')
{
$splashbusy.Text = $return + 'Cannot be Null or Empty'
$Splashform.Visible = $true
Start-Sleep 5
$Splashform.Visible = $false
Return 'Stop'
}
}
$rootDir = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
[void]$Form.ShowDialog()