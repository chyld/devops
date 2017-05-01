Dir.chdir 'base16-gnome-terminal'
`chmod +x *.sh`

Dir.foreach('.') do |item|
  if item.end_with? '.sh'
    cmd = "./#{item}"
    puts cmd
    `#{cmd}`
  end
end

