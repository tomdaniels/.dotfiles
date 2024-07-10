return {
  s({
    trig = "dlog",
    name = "Insert debug console log",
    desc = "Inserts a console.log() with @@@ prefixed for debugging",
  }, {
    t("console.log(\"@@@"),
    t("\", "),
    i(1),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t(");")
  }),
}
