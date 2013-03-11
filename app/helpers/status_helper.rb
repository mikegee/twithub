module StatusHelper

  def link_mentions(status_content)
    msg = status_content.gsub /(\A|\W)(@(\w+))/ do
      if u = User.find_by_nickname($3)
        $1 + link_to($2, u)
      else
        $1 + $2
      end
    end
    auto_link(msg)
  end

end
