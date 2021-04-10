// $(function(){
//   $('#new_comment').on('submit', function(e){
//     e.preventDefault();
//     // console.log(this)
//     var formData = new FormData(this);
//     var url = $(this).attr('action')
//     $.ajax({
//       url: url,
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//   })
// })

// attrメソッド
// 要素が持つ指定属性の値を返します。
// 要素が指定属性を持っていない場合、関数はundefinedを返します。
// 今回はイベントが発生した要素のaction属性の値を取得しており、今回のaction属性にはフォームの送信先のurlの値が入っています。

// processDataオプション
// デフォルトではtrueになっており、dataに指定したオブジェクトをクエリ文字列(例: msg.txt?b1=%E3%81%8B&b2=%E3%81%8D )に変換する役割があります。
// クエリ文字列とは、WebブラウザなどがWebサーバに送信するデータをURLの末尾に特定の形式で表記したものです。

// contentTypeオプション
// サーバにデータのファイル形式を伝えるヘッダです。こちらはデフォルトでは「text/xml」でコンテンツタイプをXMLとして返してきます。
// ajaxのリクエストがFormDataのときはどちらの値も適切な状態で送ることが可能なため、falseにすることで設定が上書きされることを防ぎます。FormDataをつかってフォームの情報を取得した時には必ずfalseにするという認識です。