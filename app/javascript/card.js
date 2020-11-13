const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit",(e)=>{
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = { 
      number: formData.get("order[number]"),                                 /* formData.getの記述はformDataを使っていたら使える記述 */
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {                          /*カード情報をPAY.JP側に送りトークン化するためのpay.jsが提供する記述。また、第二引数はアロー関数を用いて処理を書いている */
      if (status == 200) {                                                   /* HTTPステータスコードが200(処理が成功)だった時 */
        const token = response.id;                                           /* トークンの値を取得 */
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;/*valueは実際に送られる値、nameはその値を示すプロパティ名（params[:name]のように取得できるようになる）type="hidden"でブラウザ上で非公開にしている */
        renderDom.insertAdjacentHTML("beforeend", tokenObj);                 /* tokenObjをbeforeend(内部の最後の使用その後に挿入)している */
      }
      document.getElementById("card-number").removeAttribute("name");       /* フォームに存在するクレジットカードの各情報を削除する */
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);