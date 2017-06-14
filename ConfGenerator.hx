import haxe.macro.Context;
import haxe.macro.Expr;

class ConfGenerator {
  macro static public function build():Array<Field> {
    var config_str = sys.io.File.read("abe2config.json").readAll().toString();
    var config = haxe.Json.parse(config_str);
    var out = haxe.macro.Compiler.getOutput();
    var fields = Context.getBuildFields();
    var cls = Context.getLocalClass();
    var defines = Context.getDefines();


    var mod_fields = [for(f in fields) if (f.name != "new") f.name];
    mod_fields = [for (m in mod_fields) 'location /$m { content_by_lua_block { app.$m(); }}'];

    var fo_app = sys.io.File.write(config.app_conf, false);
    var wd = Sys.getCwd();
    var init = 'lua_package_path "${config.package_path}/?.lua;;";\ninit_by_lua_block { app = require("app").$cls.new() }';
    fo_app.writeString(init);
    fo_app.close();

    var fo_routes = sys.io.File.write(config.route_conf, false);
    var locations = mod_fields.join("\n");
    fo_routes.writeString(locations);
    fo_routes.close();
    return fields;
  }
}
