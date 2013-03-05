namespace $rootnamespace$.Events
{
    using System;

    using EventStore;
    using EventStore.Dispatcher;

    using NServiceBus;

    public class NServiceBusDispatchCommits : IDispatchCommits
    {
        private readonly IBus bus;

        [CLSCompliant(false)]
        public NServiceBusDispatchCommits(IBus bus)
        {
            this.bus = bus;
        }

        [CLSCompliant(false)]
        public void Dispatch(Commit commit)
        {
            if (commit == null)
            {
                throw new ArgumentNullException("commit");
            }

            foreach (EventMessage eventMessage in commit.Events)
            {
                // To Do: Think about adding headers before publishing. See:
                //  - http://stackoverflow.com/questions/6790712/nservicebus-publishing-event-recieves-empty-message
                //  - http://stackoverflow.com/questions/5564130/eventstore-nservicebus-setup
                this.bus.Publish(eventMessage.Body);
            }
        }

        public void Dispose()
        {
            this.Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                // Dispose managed resources
            }

            // Free native resources
        }
    }
}