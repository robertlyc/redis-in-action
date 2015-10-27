def check_token(conn, token)
  return conn.hget('login:', token)
end

def update_token(conn, token, user, item=nil)
  timestamp = Time.now
  conn.hset('login:', token, user)
  conn.zadd('recent:', token, timestamp)
  if item
    conn.zadd('viewed:', token, item, timestamp)
    conn.zremrangedbyrank('viewed:', token, 0, -26)
  end
end