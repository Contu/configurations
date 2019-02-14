#/bin/bash

BASE_DIR="/home/salvatore/Documents"
FILE_NAME="contu.rss"
TITLE=$1;
DESCRIPTION=$2;

if [[ $# -eq 2 ]]; then

    read -r -d '' TEMPLATE << EOM
<item>
  <title><![CDATA[#TITLE#]]></title>
  <description><![CDATA[#DESCRIPTION#]]></description>
  <pubDate>#DATE#</pubDate>
</item>
EOM

    read -r -d '' TEMPLATE << EOM
${TEMPLATE//#TITLE#/$TITLE}
EOM

    read -r -d '' TEMPLATE << EOM
${TEMPLATE//#DESCRIPTION#/$DESCRIPTION}
EOM

    read -r -d '' TEMPLATE << EOM
${TEMPLATE//#DATE#/`date`}
EOM

    head -n 6 ${BASE_DIR}/$FILE_NAME > ${BASE_DIR}/updateFeed.rss

    echo $TEMPLATE >> ${BASE_DIR}/updateFeed.rss

    tail -n $( expr $(wc -l < ${BASE_DIR}/$FILE_NAME) - 6 ) ${BASE_DIR}/$FILE_NAME >> ${BASE_DIR}/updateFeed.rss

    mv ${BASE_DIR}/$FILE_NAME{,.bak}

    mv ${BASE_DIR}/updateFeed.rss ${BASE_DIR}/contu.rss

    xmllint --format ${BASE_DIR}/contu.rss --output ${BASE_DIR}/contu.rss 

else
    echo "I want two arguments, that is, title and description"
fi



