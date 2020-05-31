10. ユーザー情報の更新成功のテスト

	- 実装する前にテストを行う
	- 正しいふるまいの確認
	- passwprd の　validation　に　allow_nil: true を設定
	- 新規登録時はhas_secure_passwordによって勝手にpasswordがからの状況を許可しないようになっている。
	- したがって、このallow_nil: true　はそれ以外のところで適用されることになる
	- 10.2.1ユーザーにログインを要求するのところ
	- 	ログアウトして最初　users/1 にアクセスして調べたのがまちがい
	- 	users/1/editにしか制限がかかっていない。
	- 	その過程で、ブラウザに_sample_app_sessionが残っていることに疑問
	- 	どうやら、サーバー側には残るもので、ブラウザ側の「user_id」などが削除されていれば
	- 	処理は完結するらしいが、セキュリティ的にはだめなのか？みたいな感じ。
	- リスト10.29
	- 	sessions_controller.rb の　redirect_back_or メソッドの引数
	- 	user か　@user　か　？？
	- 	テキストでは　user だが、エラーメッセージをもとに　@userにするとテストをパス
	- 	

