([
"name": "Roxen CMS Editor Component",
"prefix": "roxeditcomp",
"body": #"
#include <module.h>
inherit \"roxen-module://shared-component-code\";

import Sitebuilder.Editor;

constant module_name = \"CMS Editor Component: ${1:Component Name}\";
string module_doc = \"To be provided\";

class ${2:[CompName]}ComponentPlugin
{
  inherit AbstractComponentPlugin;

  //! Returns a user-presentable name for this component.
  string get_component_name()
  {
    return \"${3:Display Name in Component List}\";
  }

  //! Returns the name of the XML element which this editor implements,
  //! e.g. \"foo\" for <foo>...</foo>.
  string get_component_tag()
  {
    return \"${4:XML Node name}-component\";
  }

  array(string) get_component_fields()
  {
    return ({
      \"variant\",
      // \"all-other\",
      // \"component-fields\"
    });
  }

  // All methods below can be removed if their default behaviour is fine

#if 0
  //!  Asks the editor whether it's ok to insert more than one component of
  //!  this type on the page.
  bool get_component_allow_multiple()
  {
    //  Default to ok
    return true;
  }

  //!  Asks whether this component type may be deleted from the page.
  int get_component_allow_delete()
  {
    //  Default to ok
    return 1;
  }

  //! Return true if this component type also should be a container
  //! for other components.
  int get_component_is_group()
  {
    return 0;
  }

  //! Returns whether this component type allows given component type
  //! inside it. Only applicable for group components.
  int get_component_allow_child_component(AbstractComponentPlugin plugin)
  {
    return 1;
  }

  //! Returns whether this component type is allowed inside given
  //! component type. At the top level @[plugin] is 0.
  int get_component_allow_parent_component(void|AbstractComponentPlugin plugin)
  {
    return 1;
  }

  //! Controls if the XSLT output should be included in hidden form in
  //! the editor view. Only needed for components which have special
  //! dependencies on each other.
  int get_component_need_preview()
  {
    return 0;
  }

  //! Decided whether the XSLT output is dependent on the presence of
  //! other components on the page. If one or more tag names are returned
  //! the editor will refresh this component's preview every time one of
  //! the dependency components are added, removed or modified.
  //!
  //! Each entry in the returned multiset must be a full tag/subtag string
  //! to match on. The special \"foo|*\" substring is allowed to match on all
  //! subtags of \"foo\".
  multiset(string) get_component_refresh_dependencies()
  {
    return 0;
  }

  //! Returns whether this editor is applicable to the given file content
  //! type.
  int get_component_allow_content_type(string ct)
  {
    // By default the editors can only be applied to Page pages which
    // does not have special restrictions. The news and menu plugins
    // will override this to only allow its corresponding components.
    return ct == \"sitebuilder/xml-page-editor\";
  }

  int get_component_allow_file(FS.SBFile file)
  {
    // Default to ok
    return 1;
  }

#endif
}


class ${2:[CompName]}ComponentInstance
{
  inherit AbstractComponentInstance;

  string render_editor(string var_prefix, RequestID id)
  {
    return
      render_field(\"${5:fieldname}\",
        ([ \"title\" : \"${6:Field Name}\",
           \"type\"  : \"string\",
           \"size\"  : \"60\",
           \"name\"  : var_prefix + \"${5:fieldname}\" ]), id);
      /* +
      render_field(\"otherfieldname\",
        ([ \"title\" : \"Other Field\",
           \"type\"  : \"string\",
           \"size\"  : \"60\",
           \"name\"  : var_prefix + \"otherfieldname\" ]), id);
      */
  }

  void save_variables(string var_prefix, RequestID id)
  {
    set_field(\"${5:fieldname}\", id->variables[var_prefix + \"${5:fieldname}\"]);
    /*set_field(\"otherfieldname\", id->variables[var_prefix + \"otherfieldname\"]);*/
  }
}
"
])
