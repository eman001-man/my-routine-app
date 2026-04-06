<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI川柳・五七五の友</title>
    <style>
        body {
            font-family: "Sawarabi Mincho", serif; /* 縦書き風の落ち着いたフォント */
            background-color: #f4f1ea;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 4px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
            border: 2px solid #5d5d5d;
            max-width: 350px;
            width: 90%;
        }
        .senryu-box {
            font-size: 1.8rem;
            writing-mode: vertical-rl; /* 縦書き */
            text-orientation: upright;
            margin: 30px auto;
            height: 250px;
            letter-spacing: 0.3rem;
            line-height: 2.5;
        }
        button {
            background-color: #8c2727; /* 漆塗りっぽい赤 */
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 1rem;
            cursor: pointer;
            border-radius: 20px;
            transition: 0.3s;
        }
        button:hover { background-color: #a63e3e; }
        .loading { color: #888; font-size: 0.8rem; }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Sawarabi+Mincho&display=swap" rel="stylesheet">
</head>
<body>

<div class="container">
    <h2 id="title">AI川柳</h2>
    
    <div id="senryuDisplay" class="senryu-box">
        ボタンを<br>押せば一句<br>生まれます
    </div>

    <button onclick="generateSenryu()" id="genBtn">一句ひねる</button>
    <p id="status" class="loading"></p>
</div>

<script>
    // 今回は「ランダムに組み合わせる」方式で、ネットがなくても動くAI風にします
    const kami = ["パソコンで", "AIが", "窓際に", "40代", "コーヒーと", "散歩道"];
    const naka = ["五七五を", "悩み抜いて", "夢を追い", "キーを叩いて", "風に吹かれて", "アイデアが"];
    const shimo = ["詠んでみた", "朝の風", "一歩ずつ", "花開く", "筆進む", "冬の空"];

    function generateSenryu() {
        const status = document.getElementById('status');
        status.innerText = "考え中...";
        
        setTimeout(() => {
            const k = kami[Math.floor(Math.random() * kami.length)];
            const n = naka[Math.floor(Math.random() * naka.length)];
            const s = shimo[Math.floor(Math.random() * shimo.length)];
            
            document.getElementById('senryuDisplay').innerHTML = `${k}<br>${n}<br>${s}`;
            status.innerText = "";
        }, 500); // 0.5秒だけ「考えてるフリ」をさせる演出です
    }
</script>

</body>
</html>
