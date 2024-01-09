function dotenv
    # Check if the current directory has a .env file
    if test -f "$PWD/.env"
        # Load variables from .env
        set -a lines (cat "$PWD/.env" | grep -v '^#')
        for line in $lines
            set parts (string split '=' $line)
            if test (count $parts) -eq 2
                set key (string trim $parts[1])
                set value (string trim $parts[2])
                set -gx $key $value
            end
        end
        echo "Successfully loaded .env vars into the shell."
    else
        echo "No .env file found in the current directory."
    end
end
