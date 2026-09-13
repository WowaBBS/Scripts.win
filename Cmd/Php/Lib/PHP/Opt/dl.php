<?
NameSpace Call\Opt;

Return New Class('dl', 'dl[|-]', 'Enable/Disable dl') Extends TBase
{
  Function Process($Value)
  {
    If($Value===Null) Return;
    Global $PhpConfig;
    $PhpConfig['enable_dl']=($Value? 'On':'Off');
  }

  Function GetDefault() { Return True; }
};
