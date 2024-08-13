import { application } from "controllers/application"

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

eagerLoadControllersFrom("controllers", application)

import Sortable from '@stimulus-components/sortable'

application.register('sortable', Sortable)
