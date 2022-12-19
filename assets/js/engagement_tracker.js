const EngagementTracker = {
  mounted() {
    this.pushEvent("page_loaded", {
      isHidden: document.hidden,
      userData: this._gatherData()
    });

    this.startedAt = new Date();

    setTimeout(this._updatePageView.bind(this), 1000);
  },

  destroyed() {
    //Could be used to make lesser calls however we would loose info in case of newtwork failure
  },

  _updatePageView() {
    let elapsedTime = new Date() - this.startedAt;
    if (!document.hidden)
      this.pushEvent("update_pageview", {elapsedTime});

    setTimeout(this._updatePageView.bind(this), 1000)
  },

  _gatherData() {
    return {
      language: window.navigator.language,
      platform: navigator.platform,
      current_url: window.location.toString()
    }
  }

}

export default EngagementTracker
