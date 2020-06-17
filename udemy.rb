require 'mysql2'

host = 'ap-northeast-1.rds.amazonaws.com'
username = 'username'
password = 'password'
database = 'database'

# データベースとのコネクションを確立
client = Mysql2::Client.new(host: host, username: username, database: database, password: password)
puts client

# クエリ(SELECT文)の実行
results = client.query("SELECT * FROM users LIMIT 1")

# 実行結果を扱いやすくするために配列に変換
results_arr = results.to_a
p results_arr

# クエリ(SELECT文)の実行
results = client.query("SELET * FROM users LIMIT 3")

# 実行結果を扱いやすくするために配列に変換
results_arr = results.to_a
p results_arr

# 結果の1件目のレコード
p results_arr[0]

# 結果の2件目のレコード
p results_arr[1]

# 結果の3件目のレコード
p results_arr[2]

# 結果の1件目のレコードのid
p results_arr[0]['id']

# 結果の2件目のレコードのname
puts results_arr[1]['name']

# クエリ(SELECT文)の実行
results = client.query("SELECT COUNT(*) FROM users LIMIT 3")

# 実行結果を扱いやすくするために配列に変換
results_arr = results.to_a

# results_arr(配列)の0番目の要素のハッシュの"COUNT(*)"というキーの値が欲しい
p results_arr[0]["COUNT(*)"]

results = client.query("INSERT INTO products VALUES (10, 'futon', 100, NOW(), NOW())")
p results

# ちゃんとレコードが追加できていることを確認
select_results = client.query("SELECT * FROM products WHERE id = 10")
p select_results.to_a

# id(プライマリキー)のユニーク制約に引っかかるのでエラーが返ってくる
results = client.query("INSERT INTO products VALUES (10, 'futon', 100, NOW(), NOW())")
p results

# データを削除する。
delete_results = client.query("DELETE FROM products WHERE id = 10")
p delete_results

