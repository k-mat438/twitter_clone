# frozen_string_literal: true

module ApplicationHelper
  def hidden_field_tag(_name, _value = nil, _options = {})
    raise 'Happiness chainではhidden_field_tagの使用を禁止しています'
  end

  def comment_count(post)
    link_to(post_path(post.id), class: 'text-light userList') do
      tag.i(" #{post.comments.count}", class: 'bi bi-chat', style: 'font-size: 15px;')
    end
  end

  def repost_for(post)
    if post.reposts.exists?(user_id: current_user.id)
      link_to post_repost_path(post_id: post.id, id: post.reposts), data: { turbo_method: :delete },
                                                                    class: 'text-light userList' do
        tag.i(" #{post.reposts.count}", class: 'bi bi-repeat', style: 'font-size: 15px; color: #198754;')
      end
    else
      link_to post_reposts_path(post_id: post.id), data: { turbo_method: :post }, class: 'text-light userList' do
        tag.i(" #{post.reposts.count}", class: 'bi bi-repeat', style: 'font-size: 15px;')
      end
    end
  end

  def favorite_for(post)
    if post.favorites.exists?(user_id: current_user.id)
      link_to post_favorite_path(post_id: post.id, id: post.favorites), data: { turbo_method: :delete },
                                                                        class: 'text-light userList' do
        tag.i(" #{post.favorites.count}", class: 'bi bi-heart-fill', style: 'font-size: 15px; color: red;')
      end
    else
      link_to post_favorites_path(post_id: post.id), data: { turbo_method: :post }, class: 'text-light userList' do
        tag.i(" #{post.favorites.count}", class: 'bi bi-heart', style: 'font-size: 15px;')
      end
    end
  end
end
