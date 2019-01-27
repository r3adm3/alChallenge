# amends the contents of the sudoers file so that admins need paswords to sudo
file "/etc/sudoers.d/20_admin" do
    content "%admin ALL=(ALL) ALL"
    mode "0440"
end

# amends the contents of the sudoers file so that vagrant user doesn't need password
file "/etc/sudoers.d/10_vagrant" do
    content "%vagrant ALL=(ALL) NOPASSWD: ALL"
    mode "0440"
end