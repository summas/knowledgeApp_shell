
#!/bin/bash -l
ProcessName=puma
DateTime=`date`

count=`ps -ef | grep $ProcessName | grep -v grep | wc -l`
if [ $count = 0 ]; then
  echo "$ProcessName is dead: $DateTime" >> /usr/share/nginx/html/knowledgeApp/process_check.log
  cd /usr/share/nginx/html/knowledgeApp;
  rails s -b 0.0.0.0
else
  echo "$ProcessName is alive: $DateTime" >> /usr/share/nginx/html/knowledgeApp/process_check.log
fi