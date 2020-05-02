<!DOCTYPE html>
<html lang="ru">
  <head>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
    <meta charset="UTF-8" />
    <title>Корчемкина Мария</title>
    <link  href="css/style.css" rel="stylesheet">
  </head>
  <body>
    <div class="blank">
      <h2 class="write_me">КТО НАПИСАЛ</h2>
      <form class="your_form" method="POST">
        <label for="email" class="label_design">Введите email отправителя</label>
        <input type="email" id="email" name="email" class="cell" value="<?php echo $args['email'] ?? ''; ?>"/>
        <input type="submit" class="send" value="Отправить">
        <?php if (isset($args['error_msg'])): ?>
            <p class="error_message"><?php echo $args['error_msg']; ?></p>
        <?php endif; ?>
      </form>
      <?php if (isset($args['answers'])): ?>
        <div class="your_form_answer">
          <p class="label_design_answer">Имя:</p>
          <p class="label_design_answer">email:</p>
          <p class="label_design_answer">Пол:</p>
          <p class="label_design_answer">Страна:</p>
          <p class="label_design_answer">Сообщение:</p>
        </div>
        <div class="data_message">
          <?php foreach($args['answers'] as $answer): ?>
            <p class="cell_answer"><?php echo $answer; ?></p>
          <?php endforeach; ?>
        </div>
        </div>
      <?php endif; ?>
    </div>
  </body>
</html>
