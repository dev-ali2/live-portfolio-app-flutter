'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "ffd2ef6676be80b27c8870a7d601bc53",
"assets/AssetManifest.bin.json": "6990b510a06a4bbdd0547814479815bb",
"assets/AssetManifest.json": "8d394ad797300951f582a654262c3a29",
"assets/assets/fonts/agustina.otf": "7b9833076716a8d14eec0cf885a3153c",
"assets/assets/fonts/AlexBrush-Regular.ttf": "d077db8c8d36554beba419eb5c1f0bff",
"assets/assets/fonts/montserrat.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/assets/fonts/poppins/Poppins-Bold.ttf": "a3e0b5f427803a187c1b62c5919196aa",
"assets/assets/fonts/poppins/Poppins-Italic.ttf": "5e956c44060a7b3c0e39819ae390ab15",
"assets/assets/fonts/poppins/Poppins-light.ttf": "f6ea751e936ade6edcd03a26b8153b4a",
"assets/assets/fonts/poppins/Poppins-Regular.ttf": "8b6af8e5e8324edfd77af8b3b35d7f9c",
"assets/assets/fonts/TrajanPro-Bold.otf": "12d2fa3dcf227b9538084a6bcfeafcf0",
"assets/assets/fonts/TrajanPro-Regular.ttf": "d198b580192576c8050cae9332108aac",
"assets/assets/images/app/appicon.png": "30ffc8c17ae35ca386df82f57993e757",
"assets/assets/images/app/appicon2.png": "679b3bcaea34299a32093730701e5459",
"assets/assets/images/personal/main_image-min.png": "4fe2ca48d94c14b314a183fa73b9365a",
"assets/assets/images/personal/main_image.png": "0def779c2496e5c06782daa1eb14b3e1",
"assets/assets/images/personal/main_image_about-min.png": "f8ff2a0ae1f1227bcffb6f30f33c9157",
"assets/assets/images/personal/main_image_about.png": "de57089af5df14370d662f0c16f66672",
"assets/assets/images/personal/main_image_about_cropped-min.png": "44716be1bc7aac0f3478403678525db6",
"assets/assets/images/personal/main_image_about_cropped.png": "86687459a4cec181b20914a9dd14408a",
"assets/assets/images/portfolio/aazadi_banner_portfolio.png": "75d79a21338dbae1c7dd099e31645fec",
"assets/assets/images/portfolio/azaadivpn.png": "eff32e4c6203be904a8da50e761812f9",
"assets/assets/images/portfolio/convoconnect.png": "3e95102b5ecae7a4eb75dc0671aab9ec",
"assets/assets/images/portfolio/convoconnect2.png": "9a51d140e2de0fb2ccc49a0a6737bce3",
"assets/assets/images/portfolio/ecommerce.png": "579e401cd00b96512c4baf812e694228",
"assets/assets/images/portfolio/fitflick.png": "035cfc12bc8f182fafda847254563209",
"assets/assets/images/portfolio/musicplayer.png": "ac5522b8b189e153f597cfc29303ab7e",
"assets/assets/images/portfolio/portfoliosite.png": "51d1c98796f56d5045716f96b29e4556",
"assets/assets/images/portfolio/uidesigns1.png": "9a2f04f1ca0e09b3205baf76f438edc9",
"assets/assets/images/portfolio/uidesigns2.png": "cfc3de9b48f31cdaed05aa53bb7d17ce",
"assets/assets/images/portfolio/uidesigns3.png": "f38847869368364e1164e62be56aae9b",
"assets/assets/images/vectors/vectorAmber-min.png": "6c273a9eced2b70a6f4ec79f6f8e3550",
"assets/assets/images/vectors/vectorBlue-min.png": "dff1b9b12b6b6f105f0d4f4554e25551",
"assets/assets/images/vectors/vectorCyan-min.png": "6ef3fbfae84b2b95dc610b18365046c2",
"assets/assets/images/vectors/vectorgreen-min.png": "f97eeb176a7666f2d5b45798fe62c9a2",
"assets/assets/images/vectors/vectorPurple-min.png": "f3bb2fba46012360b86583bb0a855158",
"assets/assets/svgs/api-svgrepo-com.svg": "a23b37313f5ec6399515918dcec1df59",
"assets/assets/svgs/bootstrap-svgrepo-com.svg": "253a2b0e2ddee099103e300d81badbe9",
"assets/assets/svgs/css3-02-svgrepo-com.svg": "2c430d8b7583d5dba7b23eff1aeafae1",
"assets/assets/svgs/dart-svgrepo-com.svg": "19a9539710aa8af85e8b0c0e337ba6b6",
"assets/assets/svgs/database-svgrepo-com.svg": "81af95d61e4b38e7722694b99af16fb4",
"assets/assets/svgs/docker-svgrepo-com.svg": "2c67e5018373071ae815cb31d0ace6d5",
"assets/assets/svgs/figma-svgrepo-com.svg": "c952e60e9a71e844c77c40d9d10f21a6",
"assets/assets/svgs/firebase-svgrepo-com.svg": "93d4b8f8f52f33e93c074f8ef5e24722",
"assets/assets/svgs/flutter-svgrepo-com.svg": "ed9ae2ef41760aff0a54ee11ee3cc657",
"assets/assets/svgs/github-svgrepo-com.svg": "0ccf038e90a1a37a00ada789d22664fd",
"assets/assets/svgs/html-124-svgrepo-com.svg": "731a107386510b93bf75d9b85440a455",
"assets/assets/svgs/javascript-16-svgrepo-com.svg": "c2df5ab5b57cc7d19b5e9461a7ebc08c",
"assets/assets/svgs/mongodb-svgrepo-com.svg": "b94156fc04986d83c49757e1916ed9cd",
"assets/assets/svgs/node-js-svgrepo-com.svg": "42f9a28046a5f3125db84550964f2a03",
"assets/assets/svgs/node.svg": "7f6f09572fd0d3eafabdb012c542807a",
"assets/assets/svgs/notion-svgrepo-com.svg": "c16f50986366520071f52f0881b9a7b7",
"assets/assets/svgs/python-16-svgrepo-com.svg": "ab4eab1d8512e7a914cd3f42ab2104c3",
"assets/assets/svgs/wordpress-svgrepo-com.svg": "03e90404a0fbf97c301a345772cd872b",
"assets/FontManifest.json": "8bcf8952943a2868426d52e6e5805d5f",
"assets/fonts/MaterialIcons-Regular.otf": "9e92f1456eb863c56be274dac1c6209e",
"assets/NOTICES": "e3ce1a9612acb53813b9ac795ad46717",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_vector_icons/fonts/AntDesign.ttf": "3a2ba31570920eeb9b1d217cabe58315",
"assets/packages/flutter_vector_icons/fonts/Entypo.ttf": "31b5ffea3daddc69dd01a1f3d6cf63c5",
"assets/packages/flutter_vector_icons/fonts/EvilIcons.ttf": "140c53a7643ea949007aa9a282153849",
"assets/packages/flutter_vector_icons/fonts/Feather.ttf": "a76d309774d33d9856f650bed4292a23",
"assets/packages/flutter_vector_icons/fonts/FontAwesome.ttf": "b06871f281fee6b241d60582ae9369b9",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Brands.ttf": "3b89dd103490708d19a95adcae52210e",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Regular.ttf": "1f77739ca9ff2188b539c36f30ffa2be",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Solid.ttf": "605ed7926cf39a2ad5ec2d1f9d391d3d",
"assets/packages/flutter_vector_icons/fonts/Fontisto.ttf": "b49ae8ab2dbccb02c4d11caaacf09eab",
"assets/packages/flutter_vector_icons/fonts/Foundation.ttf": "e20945d7c929279ef7a6f1db184a4470",
"assets/packages/flutter_vector_icons/fonts/Ionicons.ttf": "b3263095df30cb7db78c613e73f9499a",
"assets/packages/flutter_vector_icons/fonts/MaterialCommunityIcons.ttf": "b62641afc9ab487008e996a5c5865e56",
"assets/packages/flutter_vector_icons/fonts/MaterialIcons.ttf": "8ef52a15e44481b41e7db3c7eaf9bb83",
"assets/packages/flutter_vector_icons/fonts/Octicons.ttf": "f7c53c47a66934504fcbc7cc164895a7",
"assets/packages/flutter_vector_icons/fonts/SimpleLineIcons.ttf": "d2285965fe34b05465047401b8595dd0",
"assets/packages/flutter_vector_icons/fonts/Zocial.ttf": "1681f34aaca71b8dfb70756bca331eb2",
"assets/packages/simple_icons/fonts/SimpleIcons.ttf": "36006a2aee699bab11e4562e9bd81963",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "66deeb9907177cdaa9f98d278d04e87a",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "504ccaa9225493cf7fb0d8137e21d50d",
"icons/Icon-512.png": "bc5575dfa11beab48ea89ded8bf09365",
"icons/Icon-maskable-192.png": "504ccaa9225493cf7fb0d8137e21d50d",
"icons/Icon-maskable-512.png": "bc5575dfa11beab48ea89ded8bf09365",
"index.html": "dce45950143fc4494a052baa04220323",
"/": "dce45950143fc4494a052baa04220323",
"main.dart.js": "0d0b92040819b9703b54a81ebc3dc6d5",
"manifest.json": "716afece894446bdebc6d5fabb7be767",
"version.json": "90a7b7dfabf3ceff76aae09ec60bf789"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
