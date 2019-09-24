function mdfmt
	for md in $argv
        pandoc \
            -f markdown+yaml_metadata_block \
            -t markdown+yaml_metadata_block \
            --atx-headers \
            -o $md $md
    end
end
