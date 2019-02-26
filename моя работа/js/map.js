alert('Для более удобного использования сайта - разверните телефон')

ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map('map', {
            center: [47.01695073802581,28.84861999819907],
            zoom: 12
        }, {
            searchControlProvider: 'yandex#search'
        });
    
    // Функция, которая по состоянию чекбоксов в меню
    // показывает или скрывает геообъекты из выборки.
    function checkState () {
        var shownObjects,
            byColor = new ymaps.GeoQueryResult(),
            byShape = new ymaps.GeoQueryResult();
        
        // Отберем объекты по цвету. 
        if ($('#red').prop('checked') === true) {
            // Будем искать по двум параметрам:
            // - для точечных объектов по полю preset;
            // - для контурных объектов по цвету заливки.
            byColor = myObjects.search('options.fillColor = "#ff1000"')
                .add(myObjects.search('options.preset = "islands#redIcon"'));
        }
        if ($('#green').prop('checked') === true) {
            byColor = myObjects.search('options.fillColor = "#00ff00"')
                .add(myObjects.search('options.preset = "islands#greenIcon"'))
                // После того, как мы нашли все зеленые объекты, добавим к ним
                // объекты, найденные на предыдущей итерации.
                .add(byColor);
        }
        if ($('#yellow').prop('checked') === true) {
            byColor = myObjects.search('options.fillColor = "#ffcc00"')
                .add(myObjects.search('options.preset = "islands#yellowIcon"'))
                .add(byColor);
        }
        // Отберем объекты по форме.
        if ($('#point').prop('checked')) {
            byShape = myObjects.search('geometry.type = "Point"');
        }
        
        
        // Мы отобрали объекты по цвету и по форме. Покажем на карте объекты,
        // которые совмещают нужные признаки.
        shownObjects = byColor.intersect(byShape).addToMap(myMap);
        // Объекты, которые не попали в выборку, нужно убрать с карты.
        myObjects.remove(shownObjects).removeFromMap(myMap);
    }
    
    $('#red').click(checkState);
    $('#green').click(checkState);
    $('#yellow').click(checkState);
    $('#point').click(checkState);
    
    // Создадим объекты из их JSON-описания и добавим их на карту.
    window.myObjects = ymaps.geoQuery({
        type: "FeatureCollection",
        features: [
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [47.03938912048536,28.85949127125733]
                },
                options: {
                    preset: 'islands#redIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [47.04515899776248,28.862074972298334]
                },
                options: {
                    preset: 'islands#redIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [47.03797033097824,28.885081921177793],
                    radius: 10000
                },
                options: {
                    preset: 'islands#redIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [46.99979995006624,28.860198362605807],
                    radius: 10000
                },
                options: {
                    preset: 'islands#redIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [47.016195250884365,28.847039034879423],
                    radius: 10000
                },
                options: {
                    preset: 'islands#redIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [47.00461146343667,28.840560881916964],
                    radius: 10000
                },
                options: {
                    preset: 'islands#redIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [47.046067192205186,28.891261611800616],
                    radius: 10000
                },
                options: {
                    preset: 'islands#redIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [47.031855331437505,28.843567945838995],
                    radius: 10000
                },
                options: {
                    preset: 'islands#redIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [47.03459677606086,28.77668634989299],
                    radius: 10000
                },
                options: {
                    preset: 'islands#redIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [47.04725260831371,28.862761366025165]
                },
                options: {
                    preset: 'islands#greenIcon'
                }
            },
            {
                type: 'Feature',
                geometry: {
                    type: 'Point',
                    coordinates: [46.98553714697271,28.844824719102654]
                },
                options: {
                    preset: 'islands#yellowIcon'
                }
            }
        ]
    }).addToMap(myMap);
}
