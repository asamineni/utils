#!/bin/bash

topic_file="$1"

while IFS= read -r topic_name; do
  # Trim leading/trailing whitespace from topic name
  topic_name=$(echo "$topic_name" | tr -d '[:space:]')
  
  #THIS LINE HAS TO BE MODIFIED
  kafka-topics.sh --bootstrap-server <host:port> --delete --topic "$topic_name"

  # Check the exit status of the delete command
  if [ $? -eq 0 ]; then
    echo "Successfully deleted topic: '$topic_name'"
  else
    echo "Error deleting topic: '$topic_name'. Please check for errors above."
    echo "Continuing to the next topic..."
  fi

done < "$topic_file"

echo "Topic deletion process completed."
