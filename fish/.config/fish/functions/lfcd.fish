function lfcd
    set tmp (mktemp)
    set fid (mktemp)

    lf -command '$printf $id > "'$fid'"' -last-dir-path=$tmp $argv

    set id (cat $fid)
    set archivemount_dir "/tmp/__lf_archivemount_"$id

    if test -f "$archivemount_dir"
        for line in (cat $archivemount_dir)
            umount "$line"
            rm -rf "$line"
        end
    end

    if test -f "$tmp"
        set dir (cat $tmp)
        rm -f "$tmp"
        if test -d "$dir"
            if test "$dir" != (pwd)
                cd "$dir"
            end
        end
    end
end

