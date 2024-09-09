{{flutter_js}}
{{flutter_build_config}}

const userConfig = {'canvasKitBaseUrl': 'canvaskit/'}
_flutter.loader.load({
    config: userConfig,
    serviceWorkerSettings: {
      serviceWorkerVersion: {{flutter_service_worker_version}},
    },
})
