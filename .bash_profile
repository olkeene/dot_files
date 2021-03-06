test=`ps -ef | grep ssh-agent | grep -v grep  | awk '{print $2}' | xargs`

if [ "$test" = "" ]; then
   # there is no agent running
   if [ -e "$HOME/agent.sh" ]; then
      # remove the old file
      rm -f $HOME/agent.sh
   fi;
   # start a new agent
   ssh-agent | grep -v echo >&$HOME/agent.sh
fi;

test -e $HOME/agent.sh && source $HOME/agent.sh
ssh-add

alias kagent="kill -9 $SSH_AGENT_PID"

ssh-add -l
