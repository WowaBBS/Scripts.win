<?
NameSpace Call\Opt;

Return New Class('ShortTags', 'ShortTags[|-]', 'On, On, Off, Default') Extends TBase
{
  Function Process($Value)
  {
    If($Value===Null) Return;
    Global $PhpConfig;
    $PhpConfig['short_open_tag']=($Value? 'On':'Off');
  }

  Function GetDefault() { Return True; }
};
