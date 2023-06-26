if [ -n "$(command -v pacman)" ]; then
    p() {
        usage() {
            print 'usage:'
            print '  p [i | in | install] <package>'
            print '  p [u | up | upgrade]'
            print '  p [s | se | search ] <query>'
            print '  p [v | vi | view   ] <package>'
            print '  p [r | rm | remove ] <package>'
        }
        if [[ $# == 0 ]]; then
            usage
            return
        fi
        local subcommand=$1
        shift
        case $subcommand; in
            i | in | install)
                pacman -S "$@"
                ;;
            u | up | upgrade)
                pacman -Syu
                ;;
            s | se | search)
                pacman -Ss "$@"
                ;;
            v | vi | view)
                pacman -Si "$@"
                ;;
            r | rm | remove)
                pacman -R "$@"
                ;;
            *)
                usage
                ;;
        esac
    }
elif [ -n "$(command -v apt)" ]; then
    p() {
        usage() {
            print 'usage:'
            print '  p [i | in | install] <package>'
            print '  p [u | up | upgrade]'
            print '  p [s | se | search ] <query>'
            print '  p [v | vi | view   ] <package>'
            print '  p [r | rm | remove ] <package>'
        }
        if [[ $# == 0 ]]; then
            usage
            return
        fi
        local subcommand=$1
        shift
        case $subcommand; in
            i | in | install)
                apt install "$@"
                ;;
            u | up | upgrade)
                apt update && apt upgrade
                ;;
            s | se | search)
                apt search "$@"
                ;;
            v | vi | view)
                apt show "$@"
                ;;
            r | rm | remove)
                apt remove "$@"
                ;;
            *)
                usage
                ;;
        esac
    }
fi
