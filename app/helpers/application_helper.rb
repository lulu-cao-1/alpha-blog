module ApplicationHelper
  def gravatar_for(user)
    url = 'https://picsum.photos/200'
    image_tag(url, alt: user.username)
  end
end
