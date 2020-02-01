function dns
  command dig "$argv" ANY +noall +answer
end

