<!-- Этот код можно поместить в шаблон статическй страницы или в main.tpl или раскидать коды по соответсвующим типам файлов -->
<style>
	#allPlacemarks {
		margin-bottom: 20px;
		height: 500px;
		margin-top: 20px;
	}
	#allPlacemarks.loading {position: relative;}
	#allPlacemarks.loading:after {
		content: " ";
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		z-index: 150;
		background: rgba(255,255,255,.8) url('data:image/GIF;base64,R0lGODlhFAAUAPQSAOzu7Pz6/PT29Nza3PTy9OTm5Pz+/Ozq7MTGxKyqrMTCxOTi5Nze3MzKzLy+vLSytNTS1NTW1Ly6vMzOzLS2tKyurJSSlJyenJSWlJyanKSipKSmpP///wAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQJBQASACwAAAAAFAAUAAAFZaAkisL4KGOqSssTiI+zzsEDwfK8MkkZ6yLAS2JwICQnoAGiWBgkh8ThpywgGgdJBHAAAEeBgSLy/K4EBbPoUGCzh+a2/ABXg+tqg4AgKJsNAXwBfl96fIRqgyKIdiOMjZCRkikhACH5BAkFAAkALAAAAAAQABAAAAVcYCKKwahMYyoWTZmc5HOkBsKIcDJhgnooPZgAAxEJXIZJ5IVybFwLBsCQIDgIp4NlMTIABgtCYgEAECYUVSJQGBSoXTUJIDcGjkeXHI+H1/9/fn5qg4OBgHGICSEAIfkECQUADgAsAQAAABIACwAABVigIzrBCA1jmhKMIZ6ioQCqYzDHizpRVdaEQQkmqOxEAZdtUXDAGhQloSAgCFyCgeAESDQDCIvEELCWDoL0AGGIZC4DpaF6TQUSmMbPvjcRaiNKgIOCgw4hACH5BAkFABEALAEAAAATAAsAAAVTYCRGxrgcY6oGRBkVKAkRqmgQgnjqSlCLrNJOgFjUXAZBbjdouAiAVIkVgAEU0QAkgSCpBAFwAWJgPB4Ml9cmlSTIvzgjF48fJHi8oz4q5CUPDiEAIfkECQUADgAsBAAAABAAEAAABVigYzikIJBoSo4OcYrLu6YmCTCBmrpOMBA6lqN2YLAEQJXLBwwwFJFgALAwFBqIgzA4URh1ukIOrANgzw2yw4xAqyFJ9SphQYzlhsjlMtiSAwgWEnI7BQ4hACH5BAkFAAgALAsAAQAJABIAAAVTIIIYQiCeSEAY6EgILSIIbAqrpnEMhW0QDMZKZFgMDrUTABYjRAbPp8gJfQ5EwljAkYCYRJBH8fFgsA4WhgySaIgcmprgIBJgIDHEBPNFGR50JyEAIfkECQUACwAsCQABAAsAEwAABVTgIi7GaJ7lqa6kaATrSwhoQMypewu5GfQnwaEwHJqExKSpQFsFJgoGTHQADBCGAwJxKD0UgERhEWAoIovvYkJJBQBpxUJQGZzUi0hlKsIbwCZ4KyEAIfkECQUADgAsBAAFABAADwAABVigI46kY5SoeI5r2rZpLDtBINi2jN+CIAOBGMywGBxgpgQDQFhEDAQGg9CKYAiKCRZAOwwKogCm4cg6Bo1VrnwJmgOKRQlgGYjMjgUiOFpQVngGEAQyeCkhACH5BAkFAAcALAAABgATAA4AAAVd4CGO5GiQZ6mubOu+MAwMqpCWgmNR92EQBJsJgtEwAo5FELAwBIABgyGBmQQOjIQAMggMCD5B8FAQiAIVGpfcFDlLk8d1bRgAWITEQhShHQBHKwUIKWs+C2YvhiohACH5BAkFAAwALAAACQATAAsAAAVUoCRRIkUwaKqi5Ciea7wCi2wHU4IYKo/6DMOgQingDgFBgAAMGhyVQYBRQAQWSMK0eRCgAojaosAQCJqrQWNaOAS1NoGCTHWXmTJAxNf+KW0qWDYhACH5BAkFAAkALAAABAATABAAAAVhYLIISWmeaGJU2BSkcGlA2cXEsaBYlIHDgMGv1EAUi6ShcdlIDk+Ew9MUGCgiPlMWZVggEIAuwfBSnQwzRcEXDAicKUA5wAAkCM5t6sDw4c04AgMEJW9nMAJrJX+AT4YwIQAh+QQFBQAKACwAAAAADgATAAAFX6AiisJontEVnGyQISw7WER8lIqRUKzhVBGD4mBZ9AYVirFxiCkCkwRC6BQRjKzIQBuJrLLbMK76BJADhUGBejIAGAuCQfAVGQwLxkEYkLPodgRjTgJ+VQYEdU4BgyYhADs=') no-repeat 50% 50%;
	}
</style>
<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU"></script>
<script>
	var catId,
		flag;

	ymaps.ready(allPlacemarks);

	function allPlacemarks() {
		var myMap = new ymaps.Map('allPlacemarks', { // ID блока с картой
				center: [25.0088, 54.9854], // координаты центра карты
				zoom: 12 // зум карты
			}),
			objectManager = new ymaps.ObjectManager({
				// Чтобы метки начали кластеризоваться, выставляем опцию.
				clusterize: true,
				// ObjectManager принимает те же опции, что и кластеризатор.
				gridSize: 32
			});

		// Задаём опции кластеров
		objectManager.clusters.options.set({
			// Установим дизайн метки по умолчанию:
			preset: 'islands#blueClusterIcons',
			// Установим балун кластера в виде карусели для удобства
			balloonContentLayout: 'cluster#balloonCarousel',
			// Устанавливаем максимальное количество элементов в нижней панели на одной странице
			clusterBalloonPagerSize: 5,
			// Устанавливаем режим открытия балуна. 
			// В данном примере балун никогда не будет открываться в режиме панели.
			clusterBalloonPanelMaxMapArea: 0,
			// Устанавливаем ширину макета контента балуна.
			balloonContentLayoutWidth: 400,
			// Устанавливаем высоту макета контента балуна.
			balloonContentLayoutHeight: 300
		});
		// Подрубаем монитор, 
		// будем отслеживать изменения в кластерах
		var activeObjectMonitor = new ymaps.Monitor(objectManager.clusters.state);

		// При клике на некластеризованные объекты получаем содержимое балуна
		objectManager.objects.events.add('click', function (e) {
			var objectId = e.get('objectId');
			setBalloonData(objectId);
		});

		// В кластеризованных объектах отслеживаем изменение выбранного объекта
		activeObjectMonitor.add('activeObject', function () {
			var objectId = activeObjectMonitor.get('activeObject').id;
			setBalloonData(objectId);
		});

		// Проверяем, есть ли у выбранного объекта содержимое балуна
		function hasBalloonData(objectId) {
			return objectManager.objects.getById(objectId).properties.balloonContent;
		}

		// Получаем данные и устанавливаем содержимое балуна
		function setBalloonData(objectId) {
			if (!hasBalloonData(objectId)) {
				getBalloonData(objectId).done(function (data) {
					var object = objectManager.objects.getById(objectId);
					object.properties.balloonContent = data;
					// Открываем балун на этом элементе
					var objectState = objectManager.getObjectState(objectId);
					if (objectState.isClustered) {
						// Если это кластер
						objectManager.clusters.balloon.open(objectState.cluster.id);
					}
					else {
						// Если обычный объект
						objectManager.objects.balloon.open(objectId);
					}
				});
			}
		}		


		getPlacemarks();
		
		// Добавляем objectManager на карту
		myMap.geoObjects.add(objectManager);

		$(document).on('click', '[data-ym-cat]', function() {
			catId = $(this).data('ymCat');
			if (flag == catId) {
				return false;
			};
			objectManager.removeAll();
			getPlacemarks(catId);
		});

		/**
		 * Получаем данные о метках на карте и выполняем необходимые процедуры :)
		 */
		function getPlacemarks(catId) {
			// Выполняем ajax-запрос к мини-модулю для вывода всех меток 
			$.ajax({
					url: dle_root + 'engine/ajax/ymaps/cat.php',
					dataType: 'json',
					data: {
						preset: 'ajaxmap',
						catId: catId
					}, // вместо ajaxmap можно прописать имя другого шаблона, содержащего в себе конфигурацию для вывода меток
				})
				.done(function (data) {
					// Если всё ок - добавим метки на карту
					objectManager.add(data);

					// Теперь надо бы найти максимальные и минимальные координаты точек
					// Для этого определим изначальные "координаты"
					var maxLat = 0,
						maxLon = 0,
						minLat = 100,
						minLon = 100;
					// пройдёмся в цикле по всем координатам
					objectManager.objects.each(function (object) {
						var lat = object.geometry.coordinates[0],
							lon = object.geometry.coordinates[1];
						// Определим максимальные и минимальные результаты
						maxLat = (lat <= maxLat) ? maxLat : lat;
						maxLon = (lon <= maxLon) ? maxLon : lon;
						minLat = (lat >= minLat) ? minLat : lat;
						minLon = (lon >= minLon) ? minLon : lon;
					}, myMap);

					// Установим границы карты в соответсвии с полученными данными
					myMap.setBounds([[minLat, minLon], [maxLat, maxLon]]);

					flag = catId;

					// "Отключим" прелодер.
					$('#allPlacemarks').removeClass('loading');
				})
				.fail(function () {
					console.log("error");
				});
		}

		// Функция, осуществляющая запрос за данными балуна на сервер.
		function getBalloonData(objectId) {
			var dataDeferred = ymaps.vow.defer();

			// Для получения новости используется модуль {AJAX FULL-STORY}:
			// http://pafnuty.name/modules/156-ajax-full-story.html
			$.ajax({
					url: dle_root + 'engine/ajax/full-story.php',
					type: 'GET',
					dataType: 'html',
					data: {
						newsId: objectId, // Обязательная переменная
						template: 'ajax/baloon'
					},
				})
				.done(function (data) {
					dataDeferred.resolve(data);
				})
				.fail(function () {
					console.log("full-story error");
					dataDeferred.resolve('error');
				});

			return dataDeferred.promise();
		}
	}
</script>
<div style="padding: 0 20px;">
	<p>Пример вывода всех меток на карте с пользовательской фильтрацией по категория и подгрузкой полной новости в балуны меток и кластеров.</p>
	<p>Для загрузки контента в балуны используется модуль <a href="http://pafnuty.name/modules/156-ajax-full-story.html" target="_blank">{AJAX FULL-STORY}</a></p>
	<p>Для работы потребуется файл cat.php (его необходимо поместить по адресу /engine/ajax/ymaps/]). Забрать файл можно из <a href="http://store.pafnuty.name/purchase/" target="_blank">кабинета покупок</a></p>
	<p>Нажимайте на кнопки для фильтрации меток по категориям.</p>
	<p>
		<span class="btn btn-small" data-ym-cat="1">Категория 1</span>
		<span class="btn btn-small" data-ym-cat="2">Категория 2</span>
		<span class="btn btn-small" data-ym-cat="4">Категория 4</span>
	</p>
</div>
<div id="allPlacemarks" class="loading"></div>
