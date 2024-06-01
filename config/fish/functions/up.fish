function up
  set depth $argv[1]

  if test -z "$depth"
    set depth 1
  end

  for i in (seq $depth)
    cd ..
  end
end
