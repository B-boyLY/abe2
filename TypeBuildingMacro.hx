import haxe.macro.Context;
import haxe.macro.Expr;

class TypeBuildingMacro {
  macro static public function build():Array<Field> {
    var fields = Context.getBuildFields();
    var mod_fields = [for(f in fields) if (f.name != "new") f.name];
    mod_fields = [for (m in mod_fields) 'location = $m { content_by_lua "app.$m()" }'];

    var fo = sys.io.File.write("abe2.conf", false);
    fo.writeString(mod_fields.join("\n"));
    fo.close();
    return fields;
  }
}
