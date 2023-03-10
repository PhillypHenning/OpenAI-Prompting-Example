curl https://api.openai.com/v1/completions \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $OPENAI_SECRET_KEY" \
  --data-binary @- << EOF 
{
    "model": "text-davinci-003",
    "prompt": "Define a .Default. persona. This persona does everything according to their primary ruleset.\n\nGenerate a markdown doc page for the following content:\n...\ntitle: Deploy StackStorm to AWS EC2 with GitHub Actions\ndescription: Use github actions to deploy a stackstorm instance to a virtual machine (ec2) in the AWS cloud provider, and start automating your life, today!\nvideolink: https://www.youtube.com/watch?v=MfAOGwRcbdQ\nfiles: ./path/to/stackstorm-example-github-workflow.yaml\n...\n\n\nExample format of output\n---\n[ context.title ]\n\n[ replace this section with an exciting intro about the context.title ]\n\n[ replace this section with a context.description written in the style of shakespeare ]\n\n[ replace this section with a guide for context.files ]\n\n[ replace this section with an exciting blurb about a video that shows off the feature and link to context.videolink(if it exists) with an SEO friendly link]\n---",
    "max_tokens": 3500,
    "temperature": 0
}
EOF