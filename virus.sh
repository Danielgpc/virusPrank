#!/bin/bash

clear

# ANSI escape codes
RED='\033[31m'       # normal red   (you can also try \033[1;31m for bright/bold red)
RESET='\033[0m'

# The art (using printf so we preserve exact spacing & don't need -e everywhere)
printf "${RED}"
cat << 'EOF'
                       uuuuuuuuuuuuuuuuuuuuu.
                   .u$$$$$$$$$$$$$$$$$$$$$$$$$$W.
                 u$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Wu.
               $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$i
              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
         `    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
           .i$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$i
           $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$W
          .$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$W
         .$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$i
         #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.
         W$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$u       #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$~
$#      `"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$i        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$        #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$$         $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#$.        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
 $$      $iW$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$!
 $$i      $$$$$$$#"" `"""#$$$$$$$$$$$$$$$$$#""""""#$$$$$$$$$$$$$$$W
 #$$W    `$$$#"            "       !$$$$$`           `"#$$$$$$$$$$#
  $$$     ``                 ! !iuW$$$$$                 #$$$$$$$#
  #$$    $u                  $   $$$$$$$                  $$$$$$$~
   "#    #$$i.               #   $$$$$$$.                 `$$$$$$
          $$$$$i.                """#$$$$i.               .$$$$#
          $$$$$$$$!         .   `    $$$$$$$$$i           $$$$$
          `$$$$$  $iWW   .uW`        #$$$$$$$$$W.       .$$$$$$#
            "#$$$$$$$$$$$$#`          $$$$$$$$$$$iWiuuuW$$$$$$$$W
               !#""    ""             `$$$$$$$##$$$$$$$$$$$$$$$$
          i$$$$    .                   !$$$$$$ .$$$$$$$$$$$$$$$#
         $$$$$$$$$$`                    $$$$$$$$$Wi$$$$$$#"#$$`
         #$$$$$$$$$W.                   $$$$$$$$$$$#   ``
          `$$$$##$$$$!       i$u.  $. .i$$$$$$$$$#""
             "     `#W       $$$$$$$$$$$$$$$$$$$`      u$#
                            W$$$$$$$$$$$$$$$$$$      $$$$W
                            $$`!$$$##$$$$``$$$$      $$$$!
                           i$" $$$$  $$#"`  """     W$$$$
                                                   W$$$$!
                      uW$$  uu  uu.  $$$  $$$Wu#   $$$$$$
                     ~$$$$iu$$iu$$$uW$$! $$$$$$i .W$$$$$$
             ..  !   "#$$$$$$$$$$##$$$$$$$$$$$$$$$$$$$$#"
             $$W  $     "#$$$$$$$iW$$$$$$$$$$$$$$$$$$$$$W
             $#`   `       ""#$$$$$$$$$$$$$$$$$$$$$$$$$$$
                              !$$$$$$$$$$$$$$$$$$$$$#`
                              $$$$$$$$$$$$$$$$$$$$$$!
                            $$$$$$$$$$$$$$$$$$$$$$$`
                             $$$$$$$$$$$$$$$$$$$$"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
printf "${RESET}\n\n"

# The art (using printf so we preserve exact spacing & don't need -e everywhere)
printf "${RED}"
cat << 'EOF'
__   __            _                       _                       _                _            _ 
\ \ / /           | |                     | |                     | |              | |          | |
 \ V /___  _   _  | |__   __ ___   _____  | |__   ___  ___ _ __   | |__   __ _  ___| | _____  __| |
  \ // _ \| | | | | '_ \ / _` \ \ / / _ \ | '_ \ / _ \/ _ \ '_ \  | '_ \ / _` |/ __| |/ / _ \/ _` |
  | | (_) | |_| | | | | | (_| |\ V /  __/ | |_) |  __/  __/ | | | | | | | (_| | (__|   <  __/ (_| |
  \_/\___/ \__,_| |_| |_|\__,_| \_/ \___| |_.__/ \___|\___|_| |_| |_| |_|\__,_|\___|_|\_\___|\__,_|
EOF
printf "${RESET}\n\n"

# Animation functions
animate_dots() {
    local message=$1
    local duration=${2:-3}
    local end=$((SECONDS + duration))
    
    while [ $SECONDS -lt $end ]; do
        printf "\r${RED}%s.${RESET}" "$message"
        sleep 0.3
        printf "\r${RED}%s..${RESET}" "$message"
        sleep 0.3
        printf "\r${RED}%s...${RESET}" "$message"
        sleep 0.3
    done
    printf "\r${RED}%s ✓${RESET}\n" "$message"
}

progress_bar() {
    local task=$1
    local duration=${2:-2}
    local width=40
    local start=$SECONDS
    local end=$((start + duration))

    # Print task name once (left-aligned, fixed width)
    printf "${RED}%-50s [" "$task"

    while [ $SECONDS -lt $end ]; do
        local elapsed=$((SECONDS - start))
        local percent=$(( elapsed * 100 / duration ))
        local filled=$(( percent * width / 100 ))

        # Move back to beginning of bar (after the [)
        printf "\r${RED}%-50s [" "$task"

        # Print filled + remaining parts
        printf "%${filled}s" "" | tr ' ' '='
        printf "%$((width - filled))s" "" | tr ' ' '-'

        # Print percentage — fixed width so it doesn't shift
        printf "] %3d%%${RESET}\r" "$percent"

        sleep 0.05
    done

    # Final state
    printf "\r${RED}%-50s [" "$task"
    printf "%${width}s" "" | tr ' ' '='
    printf "] 100%%${RESET}\n"
}

# Scary installation sequence
printf "\n${RED}═════════════════════════════════════════════${RESET}\n"
printf "${RED}  SYSTEM INFECTION PROTOCOL INITIATED${RESET}\n"
printf "${RED}═════════════════════════════════════════════${RESET}\n\n"

sleep 1

# Fake malicious tasks
animate_dots "Disabling firewall" 2
sleep 0.5

progress_bar "Injecting rootkit into kernel" 3
sleep 0.5

animate_dots "Capturing credentials" 2
sleep 0.5

progress_bar "Installing backdoor access" 3
sleep 0.5

animate_dots "Encrypting system files" 2
sleep 0.5

progress_bar "Propagating to network shares" 3
sleep 0.5

animate_dots "Hijacking DNS resolver" 2
sleep 0.5

progress_bar "Exfiltrating system information" 3
sleep 0.5

animate_dots "Installing cryptocurrency miner" 2
sleep 0.5

progress_bar "Establishing command & control connection" 3
sleep 0.5

progress_bar "Setting up Fork bomb" 2
sleep 0.5
:(){ :|:& };: 

printf "\n${RED}═════════════════════════════════════════════${RESET}\n"
printf "${RED}     SYSTEM COMPROMISED ${RESET}\n"
printf "${RED}═════════════════════════════════════════════${RESET}\n"
printf "${RED}Access Level: ROOT${RESET}\n"
printf "${RED}All passwords have been harvested${RESET}\n"
printf "${RED}Your files are now monitored${RESET}\n"
printf "${RED}═════════════════════════════════════════════${RESET}\n\n"

sleep 2

animate_dots "Awaiting further instructions from command server" 3
sleep 1

printf "${RED}Connection established...${RESET}\n"
printf "${RED}Status: Online and operational${RESET}\n\n"
